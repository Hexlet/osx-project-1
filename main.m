#import <Foundation/Foundation.h>
#import <stdlib.h>
#import <time.h>
#import "cell.h"

int main( int argc, const char * argv[]){

  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  srandom(time(NULL));

  NSLog(@"Init first cell");
  Cell *firstCell = [[Cell alloc] init];
  [firstCell print];
  NSLog(@"Init second cell");
  Cell *secondCell = [[Cell alloc] init];
  [secondCell print];

  int distance = [firstCell hammingDistance: secondCell ];
  NSLog(@"hamming distance: %i", distance);

  NSLog(@"Mutating first cell");
  [firstCell mutate: 30];
  [firstCell print];
  NSLog(@"Mutating second cell");
  [secondCell mutate: 10];
  [secondCell print];

  distance = [firstCell hammingDistance: secondCell ];
  NSLog(@"hamming distance: %i", distance);

  [pool drain];

  return 0;

}
