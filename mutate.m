#import "mutate.h"

@implementation Cell (Mutate)

  static NSMutableArray *randomPostitionList;

  -(void)mutate:(int) x{

    [self initPostitionsArray];

    int numberOfElementsToChange = (int)(x * dnaLength / 100 );
    [randomPostitionList shuffle];

    int i;
    for (i=0;i < numberOfElementsToChange; i ++) {
      [dna replaceObjectAtIndex: [[randomPostitionList objectAtIndex: i] intValue] 
                     withObject: [NitroBase getRandomNitroBaseButNot: [dna objectAtIndex: i]] 
      ];
    }

  }

  -(void)initPostitionsArray{
    if (!randomPostitionList) {
      randomPostitionList =[[NSMutableArray alloc] init];

      int i;
      for (i=0; i< dnaLength; i++) {
        [randomPostitionList addObject: [NSNumber numberWithInt:i]];
      }
    }
  }

@end



@implementation NitroBase(Mutate) 

  -(id) getRandomNitroBaseButNot: (id) currentValue {

    [self init];

    id validBases = [NitroBase getValidBases ];

    int indexToExclude=[validBases indexOfObject: currentValue];

    if (indexToExclude == NSNotFound ) {
      @throw [NSException exceptionWithName: @"valueNotFound" reason: @"currentValue parameter not found in validBases" userInfo: nil];
    }

    int index= random() % ( [validBases count] - 1  );

    if (index == indexToExclude) {
      index ++;
    }

    if ( [validBases objectAtIndex: index ] == nil )  {
      //NSLog("Index: %i", index);
      
      return @"X";
    } else { 
    return [validBases objectAtIndex: index ];
    }

  }

@end

