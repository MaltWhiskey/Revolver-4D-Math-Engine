//
//  main.cpp
//  Revolver4DMathEngine
//
//  Created by Harold Serrano on 3/2/16.
//  Copyright © 2016 haroldserrano.com. All rights reserved.
//

#include <iostream>
#include "R4DVector3n.h"
#include "R4DMatrix3n.h"
#include "R4DQuaternion.h"

int main(int argc, const char * argv[]) {
    
    //Vector to rotate
    R4DEngine::R4DVector3n v(0,1,0);
    
    //axis of rotation: x-axis
    R4DEngine::R4DVector3n axis(1,0,0);
    
    //rotate vector v about axis by 90 degrees
    R4DEngine::R4DVector3n rotatedVector=v.rotateVectorAboutAngleAndAxis(90, axis);
    
    //print result
    rotatedVector.show();
    
    return 0;
}
