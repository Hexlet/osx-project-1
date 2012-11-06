#import "nitrobase.h"
#import <stdlib.h>
#import <time.h>

@implementation NitroBase

  static NSArray *validBases;

  +(void) init{

    if (! validBases) {
      validBases=[[NSArray alloc] initWithObjects: @"A", @"T", @"G", @"C", nil ];
    }

  }

  +(id) getRandomNitroBase {

    [self init];

    int index= random() % [validBases count] ;
    return [validBases objectAtIndex: index ];

  }

  +(id) getValidBases {
    [self init];
    return validBases; 
  }

@end


