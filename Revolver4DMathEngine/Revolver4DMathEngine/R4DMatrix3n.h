//
//  R4DMatrix3n.hpp
//  Revolver4DMathEngine
//
//  Created by Harold Serrano on 3/10/16.
//  Copyright © 2016 haroldserrano.com. All rights reserved.
//

#ifndef R4DMatrix3n_hpp
#define R4DMatrix3n_hpp

#include <stdio.h>
#include <iostream>
#include "R4DVector3n.h"

namespace R4DEngine {
    
    /**
     *  Class in charge of 3N matrix
     */
    class R4DMatrix3n{
        
    private:
        
    public:
        
        /**
         *  Matrix data elements
         */
        float matrixData[9]={0.0};

#pragma mark-constructors
        
        /**
         *  Constructor
         */
        R4DMatrix3n();
        
        /**
         *  Constructor
         */
        R4DMatrix3n(float m0,float m3,float m6,float m1,float m4,float m7,float m2,float m5,float m8);
        
#pragma mark-copy constructors
        /**
         *  Copy Constructor
         */
        R4DMatrix3n& operator=(const R4DMatrix3n& value);

#pragma mark-destructors
        /**
         *  Destructor
         */
        ~R4DMatrix3n();
        
#pragma mark-matrix addition
        /**
         *  Add matrices together
         *
         *  @param m matrix
         *
         *  @return new matrix
         */
        R4DMatrix3n operator+(const R4DMatrix3n &m) const;
        
        /**
         *  Add matrices together
         *
         *  @param m matrix
         *
         *  @return new matrix
         */
        void operator+=(const R4DMatrix3n &m);
        
#pragma mark-matrix scalar multiplication
        /**
         *  Multiply matrix by scalar
         *
         *  @param s scalar
         *
         *  @return matrix product
         */
        R4DMatrix3n operator*(const float s) const;
        
        /**
         *  Multiply matrix by scalar
         *
         *  @param s scalar
         *
         */
        void operator*=(const float s);
        

#pragma mark-vector transformation
        /**
         *  transform the given vector by this matrix
         *
         *  @param v Vector
         *
         *  @return new transform vector
         */
        R4DVector3n operator*(const R4DVector3n & v) const;
        
        /**
         *  transform the given vector by this matrix
         *
         *  @param v Vector
         *
         *  @return new transform vector
         */
        R4DVector3n transform(const R4DVector3n& v) const;
        
#pragma mark-matrix multiplication
        /**
         *  Multiply matrix
         *
         *  @param m matrix
         *
         *  @return matrix product
         */
        R4DMatrix3n operator*(const R4DMatrix3n& m) const;
        
        /**
         *  Multiply matrix
         *
         *  @param m matrix
         */
        void operator*=(const R4DMatrix3n& m);
        
#pragma mark-matrix identity
        /*!
         *  @brief  set matrix to identity
         */
        void setIdentity();
        
        
#pragma mark-matrix inverse
        /**
         *  Set the matrix to be the inverse of the given matrix
         *
         *  @param m matrix
         */
        void setInverse(const R4DMatrix3n& m);
        
        /**
         *  returns a new matrix containing the inverse of the matrix
         *
         *  @return Matrix inverse
         */
        R4DMatrix3n inverse() const;
        
        /**
         *  Inverts the matrix
         */
        void invert();
        
#pragma mark-matrix determinant
        /**
         *  Gets matrix determinant
         *
         *  @return matrix determinant
         */
        float getDeterminant() const;
        
#pragma mark-matrix transpose
        /**
         *  Set the matrix as the transpose of the given matrix
         *
         *  @param m matrix
         */
        void setTranspose(const R4DMatrix3n& m);
        
        /**
         *  Transpose the matrix
         *
         *  @return matrix transpose
         */
        R4DMatrix3n transpose() const;
        
        
#pragma mark-invert and transpose the matrix
        /**
         *  Inverts and transpose the matrix
         */
        void invertAndTranspose();
        
#pragma mark-debug
        /**
         *  Debug, show the matrix in the console log
         */
        void show();
        
    };
    
}

#endif /* R4DMatrix3n_hpp */
