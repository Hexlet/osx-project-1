#import "cell.h"

const int dnaLength = 100;

@implementation Cell


  -(id) init {

    self = [super init];

    if (self) {
      dna = [[NSMutableArray alloc] init ];
      [self initWithRandomDNA];
    }

    return self;
  }


  -(void) initWithRandomDNA {
 
    int count;

    for (count=0; count < dnaLength; count++) {
      [dna addObject: [NitroBase getRandomNitroBase] ];
    }

  }


  -(void) print {
    int index;
    NSMutableString * printedDNA = [[NSMutableString alloc] init];
    for (index=0; index < [dna count]; index++) {
      [printedDNA appendString: [dna objectAtIndex: index ] ];
    }
    NSLog(printedDNA);
  }


  -(int) hammingDistance: (Cell*) otherCell  {

    int index, distance;

    for (index=0, distance=0; index < [dna count]; index ++ ) {
      if ([dna objectAtIndex: index] != [otherCell->dna objectAtIndex: index ] ) {
        distance ++;
      }
    }

    return distance;

  };

@end

