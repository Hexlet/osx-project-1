//
//  Cell.m
//  osx-project-1
//
//  Created by Roman TS on 11/2/12.
//  Copyright (c) 2012 Roman TS. All rights reserved.
//

#import "Cell.h"

static NSUInteger lenthOfDNA = 100;

@implementation Cell

@synthesize DNA=_DNA;
@synthesize markers=_markers;

-(id) init {
    if (self=[super init]){
        _DNA = [[NSMutableArray alloc] init];
        
        //init list of markers for DNA
        _markers = [[NSArray alloc] initWithObjects:@"A",@"T",@"G",@"C", nil];
        
        //fill DNA with random markers.
        for (int i = 0; i<lenthOfDNA; i++){
            [_DNA addObject: [self generateNewMarker]];
        }
    }
    return self;
}

-(NSUInteger) hammingDistance:(Cell *)aCell{
//    calculate Hamming distance between DNA of two cells
    NSUInteger count = 0;
    for (int i=0; i<lenthOfDNA; i++){
        //count hamming distance
        if(![[_DNA objectAtIndex:i] isEqualToString:[aCell.DNA objectAtIndex:i]]) count++;
    }
    return count;
}

-(NSString *) generateNewMarker{
    //generate random markers
    int randomNumber=arc4random()%[_markers count];
    NSString * marker = [_markers objectAtIndex:randomNumber];
    return marker;
}

-(NSString *) generateNewMarkerExclude:(NSString *)marker{
    
    NSMutableArray * newMarkersArray = [[NSMutableArray alloc] initWithArray:_markers];
    
//    clean newMarkersArray from exist marker
    [newMarkersArray removeObjectIdenticalTo:marker];
    
//    generate radnom index for change in range from 0 to index of last item
    NSUInteger indexForChange = (arc4random()%([newMarkersArray count]-1));
    
//    get random makrer from array with generated index
    NSString *newMarker = [newMarkersArray objectAtIndex:indexForChange];
    return  newMarker;
}
@end
