//
//  Cell.m
//  DNK
//
//  Created by Алексей Виноградов on 06.11.12.
//  Copyright (c) 2012 Алексей Виноградов. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)init{
    self= [super init];
    if (self) {
        
        _dnaarr = [NSMutableArray array];
        for(int i=0; i<=99; i++){
            
            int randValue = (arc4random() % 4) + 1;
            //NSLog(@"%d", randValue);
            if (randValue==1){
               
             [_dnaarr insertObject:@"A" atIndex:i];
                
            }
            
            if (randValue==2){
                
                [_dnaarr insertObject:@"T" atIndex:i];
                
            }
            
            if (randValue==3){
                
                [_dnaarr insertObject:@"G" atIndex:i];
                
            }
            
            if (randValue==4){
                
                [_dnaarr insertObject:@"C" atIndex:i];
                
            }
            
        }
        
        
        
        //NSLog(@"%@", _dnaarr);
    }
    
    return  self;
}



- (int)hammingDistance:(Cell *)a{
    
    int cnt = 0;
    for(int h=0; h<=99; h++){
        
        if ([self.dnaarr objectAtIndex:h]!=[a.dnaarr objectAtIndex:h]){
            cnt++;
        }
        
        
        
    }

    
    return cnt;
}

@end
