//
//  Cell.m
//  DNA1
//
//  Created by Dmitry Khayrulin on 11/3/12.
//  Copyright (c) 2012 TechAid Inc. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(void)printDNA {
    //NSLog(@"\nDNA:\n");
    //for (int i=0; i<100; i++) {
    //    NSLog(@"%i=%@",i+1,[DNA objectAtIndex:i] );
    //}
    /////////
    //[self buildDNAString];
    NSLog(@"%@", dna_string);
}

-(NSString *)getDNA {
    return dna_string;
        
}

-(void)buildDNAString{
    [dna_string setString:@""];
    for (int i=0; i<100; i++) {
        [dna_string appendString:[DNA objectAtIndex:i]];
    }

}

-(id)init{
    self = [super init];
    dna_string = [[NSMutableString alloc] init]; //used in getDNA and printDNA methods
    dict = [[NSString alloc] init];
    dict = @"ATGC";
    DNA = [[NSMutableArray alloc] init];
    NSString *obj = [[NSString alloc] init];
    int rand;
    for (int i=0; i<100; i++) {
        rand = arc4random() % 4;
        obj = [[dict substringFromIndex:rand] substringToIndex:1];
        [DNA addObject:obj];
    }
    [self buildDNAString];
    return self;
}


-(int)hummingDistance:Cell{
    int dist = 0;
    for (int i=0; i<100; i++) {
        if ([dna_string characterAtIndex:i] != [[Cell getDNA] characterAtIndex:i]) {dist++;}
    }
    return dist;
}


@end
