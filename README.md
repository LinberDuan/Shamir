# Shamir
init

    char *str = "Hello Shamir";
    NSData *data = [NSData dataWithBytes:str length:strlen(str)];
    NSArray<NSData*> *shaDataArray = [Shamir create_shares:data n:9 k:2];
    
    NSString *testStr = [NSString stringWithCharacters:shaDataArray[0].bytes length:shaDataArray[0].length];
    
    NSData *comShares = [Shamir combine_shares:shaDataArray k:2];
    
    NSString *comStr = [NSString stringWithCString:comShares.bytes encoding:NSUTF8StringEncoding];
