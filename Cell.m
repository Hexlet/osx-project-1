//
//  Cell.m
//  DNA
//
//  Created by Тимофей on 11.11.12.
//  Copyright (c) 2012 Тимофей. All rights reserved.
//

#import "Cell.h"

@implementation Cell
{
    NSMutableArray *DNA;
 //   NSMutableArray *dnaHammingDistance;
//    int hamming_distance;
//    id DNAarray;
//            NSMutableArray* DNA = [[NSMutableArray alloc] init];
     
}
+(char)dnaRandom {
    char array[4] =
    {'A', 'T', 'G', 'C'};
    int number = arc4random()%4;
//    NSLog(@"%d", number);
//    NSLog(@"%c", array[number]);
    return array[number];
}



-(id)init {
    self = [super init];
    if (self) {
        DNA = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < 100; i++) {
            char newElement = [Cell dnaRandom];
            //NSLog(@"%c", newElement);
            
            [DNA addObject:[NSString stringWithFormat:@"%c",newElement]];
        }
 //       NSLog(@"dna=  %@", DNA);
        
    }
    return DNA;
}

/*-(id)DNAHD{
  //      if (self) {
NSMutableArray *DNAHammingDistanceArray = [[NSMutableArray alloc] init];
for (int i = 0 ; i < 100; i++) {
    int newElementHammingDistance = [self dnaRandom];
    //NSLog(@"%c", newElement);
    
    [DNAHammingDistanceArray addObject:[NSString stringWithFormat:@"%c",newElementHammingDistance]];
}
            NSLog(@"dna=  %@", DNAHammingDistanceArray);

//        }
    return DNAHammingDistanceArray;
}*/

+(int)hammingDistance: (NSMutableArray*)DNAarray {
//    NSLog(@"dna=  %@", DNAarray);
    
    int hamming_distance = 0;
    
    NSMutableArray *marray = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 100; i++) {
         
       [marray addObject:[NSString stringWithFormat:@"%c", [Cell dnaRandom]]];
   }
 //   NSLog(@"%@", DNAarray[5]);
      for (int i = 0 ; i < 100; i++) {
        if (marray[i]!=DNAarray[i])
        {
            hamming_distance++;
        }
    }
   
    NSLog(@"hamming_distance = %d", hamming_distance);

//    int hamming_distance = 0;
    return hamming_distance;
 //   return 0;
}


@end
	