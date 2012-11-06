//
//  Cell.h
//  DNA1
//
//  Created by Dmitry on 11/3/12.
//  Copyright (c) 2012 TechAid Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject{
    NSMutableArray *DNA;
    NSString *dict; // to hold "ATCG"
    NSMutableString *dna_string; // one string dna
    }

-(id)init; //requeried by assignement

-(void)printDNA;

-(NSString *)getDNA;

-(void)buildDNAString;

-(int)hummingDistance:Cell; //requeried by assignement

@end
