//
//  Cell+mutator.m
//  HexletProject1
//
//  Created by F V on 11/4/12.
//  Copyright (c) 2012 F V. All rights reserved.
//

#import "Cell+mutator.h"

@implementation Cell (mutator)
-(void)mutate: (int) x
{
    if (x>100 | x<0) NSLog(@"input data error: x should be less than 100%% and more than 0. Cell will not be mutable");
    
    else
    {
    int i;
    int mutateElementsQuantity =x*[[self DNA] count]/100;
    //NSLog (@"x= %i",mutateElementsQuantity);
    NSArray *template=[NSArray arrayWithObjects:@"A",@"T",@"C",@"G", nil];
    
    for (i=0;i<mutateElementsQuantity;++i)
        {
           NSString *obj= [[self DNA] objectAtIndex:i];
            while ([[self DNA] objectAtIndex:i]==obj)
            {
                NSUInteger c= arc4random()%[template count];
                obj=[template objectAtIndex:c];
            }
            
            // NSLog(@"%lu",c);
            
            [ [self DNA] replaceObjectAtIndex:i withObject:obj];
        }
    }
}

@end
