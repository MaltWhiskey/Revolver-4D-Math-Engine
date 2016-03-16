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
    
    //create an instance of R4DMatrix3n
    R4DEngine::R4DMatrix3n m(0,0,0,
                             0,0,-1,
                             0,1,0);
    
    
    //create an instance of vector R4DVector3n
    R4DEngine::R4DVector3n v(0,1,0);
    

    //transform the vector
    R4DEngine::R4DVector3n v1=m*v;
    
    //Print the value of the vector
    v1.show();
    
    
    return 0;
}
