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

int main(int argc, const char * argv[]) {
    
    R4DEngine::R4DMatrix3n m;
    
    R4DEngine::R4DVector3n v(1,0,0);
    
    m.makeRotationMatrixAboutYAxisByAngle(90.0);
    
    R4DEngine::R4DVector3n newVector=m.transformVectorByMatrix(v);
    
    newVector.show();
    
    return 0;
}
