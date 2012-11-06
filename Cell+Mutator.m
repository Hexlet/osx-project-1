//
//  Cell+Mutator.m
//  DNAproject
//
//  Created by Lilumi Odi on 05.11.12.
//  Copyright (c) 2012 Lilumi Odi. All rights reserved.
//

#import "Cell+Mutator.h"

@implementation Cell {

}

- (id)init {
   if ( self= [super init]) {
      self.DNA = [NSMutableArray arrayWithCapacity:99];
       for (int i=0; i<=99; i++) {
          [self.DNA insertObject:[self randomCharacter] atIndex:i];
       }
       
   }
    
    return self;
}

- (id)initWithLenght:(int)length {
    if ( self= [super init]) {
        self.DNA = [NSMutableArray arrayWithCapacity:length-1];
        for (int i=0; i<=length-1; i++) {
            [self.DNA insertObject:[self randomCharacter] atIndex:i];
        }
        
    }
    
    return self;
}

- (NSString* ) randomCharacter {
    NSString* arrayOfChars = @"ACGT";
    int i = arc4random() % 4;
    NSString *value = [arrayOfChars substringWithRange:NSMakeRange(i, 1)];
    return value;
//    switch (i) {
//    case 1 : return @"A"; break;
//    case 2 : return @"C"; break;
//    case 3 : return @"G"; break;
//    case 4 : return @"T"; break;
//        default : return @"Error";
//    }
}


- (NSString* ) replaceCharacter: (NSString*) exclude {
    NSString* arrayOfChars = @"ACGT";
    arrayOfChars = [arrayOfChars stringByReplacingOccurrencesOfString:exclude withString:@""];
    int i = arc4random() % 3;
    NSString *value = [arrayOfChars substringWithRange:NSMakeRange(i, 1)];
    return value;
}

- (int) hammingDistance:(Cell *)aCell {
    int kpos = 0, i;
    for (i=0; i<=[[self DNA] count]-1; i++) {
        
        if ([self.DNA objectAtIndex:i]!= [aCell.DNA objectAtIndex:i] ) {
            kpos++;
        }
    }
    return kpos;
}

- (void) print {
    NSLog(@"%@", [_DNA componentsJoinedByString:@""]);
    
}


@end


@implementation Cell (Mutator)

- (void) mutate:(int) p {
    int n = round([self.DNA count] * p/100), length=1, randomInt;
    NSInteger indexArray[n], i=0;
    //NSLog(@"длина днк: %ld, нужно поменять %i",[self.DNA count], n);
    
    if (n>=1) {
        
    bool $present= false;
    randomInt = arc4random()%[self.DNA count];
    while (i<length && length<=n) {
        for (int j=0; j<length-1; j++) {
            if (randomInt == indexArray[j]) {
                $present = true;
                break;
            } else $present = false;
        }
        
        if ($present == true) randomInt = arc4random()%n; else {
            
            indexArray[i] = randomInt;
            //NSLog(@"Будем мутировать на позиции %ld", indexArray[i]);
            i++;
            length++;
            $present = false;
            randomInt = arc4random()%[self.DNA count];
        }
        
            
    }
        for (i=0; i<n; i++) {
            [self.DNA replaceObjectAtIndex:indexArray[i] withObject:[self replaceCharacter:[self.DNA objectAtIndex:indexArray[i] ] ]];
        }
        
        
    } else NSLog(@"Нечего менять, так как количество процентов меньше 1 единицы из ДНК");
    

    
}

@end

