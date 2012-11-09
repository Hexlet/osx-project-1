//
//  Cell.h
//  DNA
//
//  Created by phantom on 08.11.12.
//
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;

- init;
- (NSUInteger) hammingDistance : (Cell*)other;
- (NSString*) toString;
+ (NSUInteger) DNALength;
+ (NSArray*) allNucleotides;

@end
