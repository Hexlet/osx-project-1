#import "Cell+Mutator.h"


static const NSString* mutateDNAItem(NSString *item)
{
    int index = arc4random()%kMaxDNAItems;
    
    if(DNAItems[index] == item)
    {
        switch(index)
        {
            case 0: 
                index += arc4random()%(kMaxDNAItems - 1) + 1;
                break;
                
            case (kMaxDNAItems - 1): 
                index -= arc4random()%(kMaxDNAItems - 1) + 1;
                break;
                
            default:
                index += arc4random()%2 ? arc4random()%(kMaxDNAItems - index - 1) + 1 
                                        : -arc4random()%index - 1;
                break;
        }
    }
    
    return DNAItems[index];
}

static inline void swapArrayItems(unsigned *arr, unsigned i, unsigned j)
{
    arr[i] ^= arr[j]; arr[j] ^= arr[i]; arr[i] ^= arr[j];
}

@implementation Cell (Mutator)

- (void) mutate: (int) percentage
{
    assert((percentage >= 0) && (percentage <= 100));
    
    if(percentage == 0) return;
    
    unsigned indices[kDNALength];
    for(unsigned i = 0; i < kDNALength; i++)
    {
        indices[i] = i;
    }
    
    for(unsigned i = 0; i < kDNALength - 1; i++)
    {
        swapArrayItems(indices, i, arc4random()%(kDNALength - i - 1) + i + 1);
    }
    
    unsigned mutationLength = (unsigned)roundf((float)kDNALength/100.0f*percentage);
    
    for(unsigned i = 0; i < mutationLength; i++)
    {
        [dna replaceObjectAtIndex: indices[i] withObject: mutateDNAItem([dna objectAtIndex: indices[i]])];
    }
}

@end