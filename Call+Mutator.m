//
//  Call+Mutator.m
//  DNK
//
//  Created by Администратор on 11/8/12.
//  Copyright (c) 2012 witem.artem@gmail.com. All rights reserved.
//

#import "Call+Mutator.h"

@implementation Call (Mutator)

-(void)mutate: (int) x {
    int i=0;
    int temp_int;
    id temp_id1, temp_id2;
    
    int j=((x<=0)||(x>100)?(0):(size/x));
    if (j!=0) {
        for (count=0 ; count<x; count++ ) {
            temp_int=arc4random_uniform(j);
            x!=100?(i+=(temp_int==0)?1:temp_int):(count==0?i=0:i++);
            do {
                temp_int=arc4random_uniform(4);
                switch (temp_int) {
                    case 0:
                        temp_id1=@"A";
                        break;
                    case 1:
                        temp_id1=@"T";
                        break;
                    case 2:
                        temp_id1=@"G";
                        break;
                    case 3:
                        temp_id1=@"C";
                        break;
                }
                temp_id2=[DNA objectAtIndex:i ];
                if (temp_id1!=temp_id2) {
                    break;
                }
            } while (1);
            [DNA replaceObjectAtIndex:i withObject:temp_id1];
        }
    }
}

@end

