

// .h
#define single_interface(class) +(class *) shared##class;

// .m
// \ 代表下一行也属于宏
// ## 是分隔符
#define single_implementation(class, initPrivate)                                                                                                              \
                                                                                                                                                               \
    +(class *) shared##class {                                                                                                                                 \
        static class *_instance;                                                                                                                               \
        static dispatch_once_t onceToken;                                                                                                                      \
        dispatch_once(&onceToken, ^{                                                                                                                           \
            _instance = [[self alloc] initPrivate];                                                                                                            \
        });                                                                                                                                                    \
        return _instance;                                                                                                                                      \
    } - (instancetype) init {                                                                                                                                  \
        @throw [NSException exceptionWithName:@"Singleton" reason:@"Singleton should not be init again" userInfo:nil];                                         \
        return nil;                                                                                                                                            \
    }
