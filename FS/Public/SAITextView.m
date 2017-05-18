//
//  SAITextView.m
//  sai-iOS
//
//  Created by DaiFengyi on 16/2/15.
//  Copyright © 2016年 Malong Tech. All rights reserved.
//

#import "Masonry.h"
#import "SAITextView.h"
@interface SAITextView ()
@property (strong, nonatomic) UILabel *placeholderLabel;
@end
@implementation SAITextView
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initSubviews];
        [self setupSubviews];
        [self addNotificationCenterObservers];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
        [self setupSubviews];
        [self addNotificationCenterObservers];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer {
    self = [super initWithFrame:frame textContainer:textContainer];
    if (self) {
        [self initSubviews];
        [self setupSubviews];
        [self addNotificationCenterObservers];
    }
    return self;
}

- (void)initSubviews {
    UILabel *placeholderLabel = [[UILabel alloc] init];
    [self addSubview:placeholderLabel];
    self.placeholderLabel = placeholderLabel;
}

- (void)setupSubviews {
    self.placeholderLabel.textColor = self.placeholderColor ?: [UIColor lightGrayColor];
    self.placeholderLabel.font = self.font;

    [self.placeholderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        // offset 8 and 5 is caculated
        make.top.equalTo(self.mas_top).with.offset(8);
        make.left.equalTo(self.mas_left).with.offset(5);
    }];
}

- (void)addNotificationCenterObservers {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - Setter
- (void)setPlaceholder:(NSString *)placeholder {
    self.placeholderLabel.text = placeholder;
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    [self textDidChange];
}
#pragma mark - OnNotification
- (void)textDidChange {
    self.placeholderLabel.hidden = self.hasText;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
