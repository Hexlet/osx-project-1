//
//  Cell.m
//  HexletProject1
//
//  Created by F V on 11/1/12.
//  Copyright (c) 2012 F V. All rights reserved.
//

#import "Cell.h"




@implementation Cell
@synthesize  DNA;


-(Cell *)init
{
    int i;
        self =[super init];
        if (self)
        {
            DNA=[[NSMutableArray alloc]init];
            NSArray *template=[NSArray arrayWithObjects:@"A",@"T",@"C",@"G", nil];
            
            for (i=0;i<100;++i)
            {
                NSUInteger c= arc4random()%[template count];
               // NSLog(@"%lu",c);
                NSString *obj=[template objectAtIndex:c];
                [DNA addObject:obj];
            }
        }
    
    return self;}
-(void)print
{ int ElemCount=0;
    for (NSString *f in DNA)
   NSLog(@"ind %i: %@",++ElemCount,f);
    
}

-(int)hammingDistance: (Cell *) cellForCompare
{
    int countC=0;
    int i=0;
    NSString *a;
    NSString *b;
    for (i=0;i<[[self DNA] count];i++)
    {  if ((a=[[cellForCompare DNA] objectAtIndex:i]) == (b=[[self DNA] objectAtIndex:i]))
        {
            countC++;
          //print of index of coincidence
         //NSLog(@"index is %i",i);
        }
       //print of symbols of coincidence
      //NSLog(@"%@ and %@",a,b);
    }
    return countC;
        
    
}

@end
