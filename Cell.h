@interface Cell: NSObject
{
	NSMutableArray *_DNA; // maxim 100 objects inside
}
@property(strong, nonatomic) NSMutableArray *DNA;
@end