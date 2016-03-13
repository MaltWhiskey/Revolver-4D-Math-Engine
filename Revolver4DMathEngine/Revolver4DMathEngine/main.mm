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
    
    R4DEngine::R4DMatrix3n m(2,3,1,
                             2,1,4,
                             5,3,2);
    
    R4DEngine::R4DMatrix3n n=m*3.0;
    
    n.show();
    
    return 0;
}
