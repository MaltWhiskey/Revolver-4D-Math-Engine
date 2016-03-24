//
//  R4DQuaternion3n.cpp
//  Revolver4DMathEngine
//
//  Created by Harold Serrano on 3/21/16.
//  Copyright © 2016 haroldserrano.com. All rights reserved.
//

#include "R4DQuaternion.h"
#include "Constants.h"

namespace R4DEngine {
    

    R4DQuaternion::R4DQuaternion(){
    
    }
    

    R4DQuaternion::R4DQuaternion(float uS,R4DVector3n& uV):s(uS),v(uV){
    
    }
    

    R4DQuaternion::~R4DQuaternion(){
        
    }
    

    R4DQuaternion::R4DQuaternion(const R4DQuaternion & value){
        
        s=value.s;
        v=value.v;
        
    };
    

    R4DQuaternion& R4DQuaternion::operator=(const R4DQuaternion& value){
        
        s=value.s;
        v=value.v;
        
        return *this;
    };
    
#pragma mark-add
    //add
    void R4DQuaternion::operator+=(const R4DQuaternion& q){
        
        s+=q.s;
        v+=q.v;
        
    }
    
    R4DQuaternion R4DQuaternion::operator+(const R4DQuaternion& q)const{
        
        float scalar=s+q.s;
        R4DVector3n imaginary=v+q.v;
        
        return R4DQuaternion(scalar,imaginary);
    }
    
#pragma mark-substract
    //substract
    void R4DQuaternion::operator-=(const R4DQuaternion& q){
        
        s-=q.s;
        v-=q.v;
    }
    
    R4DQuaternion R4DQuaternion::operator-(const R4DQuaternion& q)const{
        
        float scalar=s-q.s;
        R4DVector3n imaginary=v-q.v;
        
        return R4DQuaternion(scalar,imaginary);
    }
    
#pragma mark-multiply
    //multiply
    void R4DQuaternion::operator*=(const R4DQuaternion& q){
        
        (*this)=multiply(q);
    }
    
    R4DQuaternion R4DQuaternion::operator*(const R4DQuaternion& q)const{
        
        float scalar=s*q.s - v.dot(q.v);
        
        R4DVector3n imaginary=q.v*s + v*q.s + v.cross(q.v);
        
        return R4DQuaternion(scalar,imaginary);
        
    }
    
    R4DQuaternion R4DQuaternion::multiply(const R4DQuaternion& q)const{
        
        float scalar=s*q.s - v.dot(q.v);
        
        R4DVector3n imaginary=q.v*s + v*q.s + v.cross(q.v);
        
        return R4DQuaternion(scalar,imaginary);
        
    }
    
#pragma mark-multiply with scalar
    void R4DQuaternion::operator*=(const float value){
        
        s*=value;
        v*=value;
    }
    
    
    R4DQuaternion R4DQuaternion::operator*(const float value)const{
        
        float scalar=s*value;
        R4DVector3n imaginary=v*value;
        
        return R4DQuaternion(scalar,imaginary);
        
    }
    
#pragma mark-multiply with vector
    R4DQuaternion R4DQuaternion::operator*(const R4DVector3n& uValue)const{
        
        
        float sPart=-(v.x*uValue.x+ v.y*uValue.y + v.z*uValue.z);
        float xPart=s*uValue.x + v.y*uValue.z - v.z*uValue.y;
        float yPart=s*uValue.y + v.z*uValue.x - v.x*uValue.z;
        float zPart=s*uValue.z + v.x*uValue.y - v.y*uValue.x;
        
        R4DVector3n vectorPart(xPart,yPart,zPart);
        R4DQuaternion result(sPart,vectorPart);
        
        return result;
        
    }
    
    
#pragma mark-dot product
    float R4DQuaternion::dot(R4DQuaternion& q){
        
        return s*q.s+v.x*q.v.x+v.y*q.v.y+v.z*q.v.z;
        
    }
    
#pragma mark-norm
    //norm
    float R4DQuaternion::norm(){
        
        float scalar=s*s;
        float imaginary=v*v;
        
        return sqrt(scalar+imaginary);
    }
    
#pragma mark-normalize
    //unit-norm
    void R4DQuaternion::normalize(){
        
        if (norm()!=0) {
            
            float normValue=1/norm();
            
            s*=normValue;
            v*=normValue;
        }
    }
    
    
#pragma mark-conjugate
    //conjugate
    R4DQuaternion R4DQuaternion::conjugate(){
        
        float scalar=s;
        R4DVector3n imaginary=v*(-1);
        
        return R4DQuaternion(scalar,imaginary);
    }
    
#pragma mark-inverse
    //inverse
    R4DQuaternion R4DQuaternion::inverse(){
        
        float absoluteValue=norm();
        absoluteValue*=absoluteValue;
        absoluteValue=1/absoluteValue;
        
        R4DQuaternion conjugateValue=conjugate();
        
        float scalar=conjugateValue.s*(absoluteValue);
        R4DVector3n imaginary=conjugateValue.v*(absoluteValue);
        
        return R4DQuaternion(scalar,imaginary);
    }
    
    void R4DQuaternion::inverse(R4DQuaternion& q){
        
        R4DQuaternion dummy=q.inverse();
        
        q=dummy;
    }
    
#pragma mark-Unit-Norm Quaternion (Special Form)
    //Unit-Norm Quaternion (Special Form)
    void R4DQuaternion::convertToUnitNormQuaternion(){
        
        float angle=DegreesToRad(s);
        
        v.normalize();
        s=cosf(angle*0.5);
        v=v*sinf(angle*0.5);
        
    }
    
#pragma mark-Matrix Transform
    //matrixTransform
    R4DMatrix3n R4DQuaternion::transformQuaternionToMatrix3n(){
        
        // 3x3 matrix - column major. X vector is 0, 1, 2, etc. (openGL prefer way)
        //	0	3	6
        //	1	4	7
        //	2	5	8
        
        
        R4DMatrix3n m;
        
        m.matrixData[0]=2*(s*s + v.x*v.x)-1;
        m.matrixData[3]=2*(v.x*v.y - s*v.z);
        m.matrixData[6]=2*(v.x*v.z + s*v.y);
        
        m.matrixData[1]=2*(v.x*v.y + s*v.z);
        m.matrixData[4]=2*(s*s + v.y*v.y)-1;
        m.matrixData[7]=2*(v.y*v.z - s*v.x);
        
        m.matrixData[2]=2*(v.x*v.z - s*v.y);
        m.matrixData[5]=2*(v.y*v.z + s*v.x);
        m.matrixData[8]=2*(s*s + v.z*v.z)-1;
        
        
        return m;
    }
    
#pragma mark-Euler To Quaternion
    //euler to quaternion
    void R4DQuaternion::transformEulerAnglesToQuaternion(float x,float y, float z){
        
        x=DegreesToRad(x);
        y=DegreesToRad(y);
        z=DegreesToRad(z);
        
        x=x/2;
        y=y/2;
        z=z/2;
        
        s=cos(z)*cos(y)*cos(x)+sin(z)*sin(y)*sin(x);
        v.x=cos(z)*cos(y)*sin(x)-sin(z)*sin(y)*cos(x);
        v.y=cos(z)*sin(y)*cos(x)+sin(z)*cos(y)*sin(x);
        v.z=sin(z)*cos(y)*cos(x)-cos(z)*sin(y)*sin(x);
        
        
    }
    
#pragma mark-Quaternion to Euler
    R4DVector3n R4DQuaternion::transformQuaternionToEulerAngles(){
        
        // 3x3 matrix - column major. X vector is 0, 1, 2, etc. (openGL prefer way)
        //	0	3	6
        //	1	4	7
        //	2	5	8
        
        
        float x=0.0;
        float y=0.0;
        float z=0.0;
        
        float test=2*(v.x*v.z-s*v.y);
        
        if (test!=1 && test!=-1) {
            
            x=atan2(v.y*v.z + s*v.x, 0.5-(v.x*v.x+v.y*v.y));
            y=asin(-2*(v.x*v.z-s*v.y));
            z=atan2(v.x*v.y+s*v.z, 0.5-(v.y*v.y+v.z*v.z));
            
        }else if (test==1){
            z=atan2(v.x*v.y+s*v.z, 0.5-(v.y*v.y+v.z*v.z));
            y=-M_PI/2.0;
            x=-z+atan2(v.x*v.y-s*v.z, v.x*v.z+s*v.y);
            
        }else if(test==-1){
            
            z=atan2(v.x*v.y+s*v.z, 0.5-(v.y*v.y+v.z*v.z));
            y=M_PI/2.0;
            x=z+atan2(v.x*v.y-s*v.z, v.x*v.z+s*v.y);
            
        }
        
        x=RadToDegrees(x);
        y=RadToDegrees(y);
        z=RadToDegrees(z);
        
        R4DVector3n euler(x,y,z);
        
        return euler;
    }
    
#pragma mark-Matrix to quaternion
    void R4DQuaternion::transformMatrix3nToQuaternion(R4DMatrix3n &uMatrix){
        
        // 3x3 matrix - column major. X vector is 0, 1, 2, etc. (openGL prefer way)
        //	0	3	6
        //	1	4	7
        //	2	5	8
        
        //calculate the sum of the diagonal elements
        
        
        float trace=uMatrix.matrixData[0]+uMatrix.matrixData[4]+uMatrix.matrixData[8];
        
        if (trace>0) {      //s=4*qw
            
            s=0.5*sqrt(1+trace);
            float S=0.25/s;
            
            v.x=S*(uMatrix.matrixData[5]-uMatrix.matrixData[7]);
            v.y=S*(uMatrix.matrixData[6]-uMatrix.matrixData[2]);
            v.z=S*(uMatrix.matrixData[1]-uMatrix.matrixData[3]);
            
        }else if(uMatrix.matrixData[0]>uMatrix.matrixData[4] && uMatrix.matrixData[0]>uMatrix.matrixData[8]){ //s=4*qx
            
            v.x=0.5*sqrt(1+uMatrix.matrixData[0]-uMatrix.matrixData[4]-uMatrix.matrixData[8]);
            float X=0.25/v.x;
            
            v.y=X*(uMatrix.matrixData[3]+uMatrix.matrixData[1]);
            v.z=X*(uMatrix.matrixData[6]+uMatrix.matrixData[2]);
            s=X*(uMatrix.matrixData[5]-uMatrix.matrixData[7]);
            
        }else if(uMatrix.matrixData[4]>uMatrix.matrixData[8]){ //s=4*qy
            
            v.y=0.5*sqrt(1-uMatrix.matrixData[0]+uMatrix.matrixData[4]-uMatrix.matrixData[8]);
            float Y=0.25/v.y;
            v.x=Y*(uMatrix.matrixData[3]+uMatrix.matrixData[1]);
            v.z=Y*(uMatrix.matrixData[7]+uMatrix.matrixData[5]);
            s=Y*(uMatrix.matrixData[6]-uMatrix.matrixData[2]);
            
        }else{ //s=4*qz
            
            v.z=0.5*sqrt(1-uMatrix.matrixData[0]-uMatrix.matrixData[4]+uMatrix.matrixData[8]);
            float Z=0.25/v.z;
            v.x=Z*(uMatrix.matrixData[6]+uMatrix.matrixData[2]);
            v.y=Z*(uMatrix.matrixData[7]+uMatrix.matrixData[5]);
            s=Z*(uMatrix.matrixData[1]-uMatrix.matrixData[3]);
        }
        
        
    }
    
    
#pragma mark-show
    void R4DQuaternion::show(){
        
        float x=v.x;
        float y=v.y;
        float z=v.z;
        
        std::cout<<"("<<s<<","<<x<<","<<y<<","<<z<<")"<<std::endl;
        
        
    }
    
}