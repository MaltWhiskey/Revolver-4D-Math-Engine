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
    
    R4DEngine::R4DMatrix3n m(2,1,4,
                             3,4,1,
                             2,1,1);
    
    R4DEngine::R4DMatrix3n n=m.transpose();
    
    
    n.show();
    
    return 0;
}
