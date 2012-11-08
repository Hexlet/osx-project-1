//
//  EfxDNA Sample project
//  Cell class
//  (c) 2012, deksden.com
//
#import <Foundation/Foundation.h>

@interface Cell : NSObject

// my class can init array of any size
@property int DNACapacity;
@property int DNAVariations; // number of nucleotids for DNA item

-(id) init;
-(id) initWithCapacity: (int) aCapacity; // for debug: ability create small array of DNA
// for future: (id) initWitCapacity: (int) aCapacity andVariations: (int) aVariations;

-(int) hammingDistance:(Cell *) cell;

// utility methods to support workflow without disclousure of DNA instance:
-(NSString*) getDNAAtIndex:(int) aIndex; // return string representation of 0-based DNA index from array: [A,T,G,C]
-(NSUInteger) getDNACount;
-(NSString*) getDNAByIndex: (int) aIndex; // return string object at index
-(void) replaceDNAAtIndex:(int) aIndex withValue: (NSString*) newValue; // replace object at index (for mutation)

#ifdef EFXDEBUG

@property NSString *logPrefix; // logging prefix
-(void)logDNA; // log all DNA items
#endif

@end
