//
//  NewsDetail.m
//  TideNews
//
//  Created by 王文辉 on 14-4-23.
//  Copyright (c) 2014年 王文辉. All rights reserved.
//

#import "NewsDetail.h"

@implementation NewsDetail

- (id) initWithData:(NSDictionary *)data
{
    self = [super initWithData:data];
    NSLog(@"data:%@",data);
    if (self) {
        self.time = [data objectForKey:@"time"];
        NSString *content = [data objectForKey:@"content"];
        if ([content isKindOfClass:[NSString class]]) {
            self.content = content;
        } else {
            self.content = @"";
        }
        
        NSString *shareUrl = [data objectForKey:@"share_url"];
        if ([shareUrl isKindOfClass:[NSString class]]) {
            self.shareUrl = shareUrl;
        } else {
            self.shareUrl = @"http://www.nntv.cn/";
        }
        
        if (self.title == nil) {
            self.title = [data objectForKey:@"uname"];
        }
    }
    return self;
}

- (NSString *) videoTag
{
                //todo need to replace the code
//    if ([self.videoUrl length] > 0 && ![self.videoUrl isNumeric]) {
////        if ([[self.videoUrl lastPathComponent] isEqualToString:@"3gp"]) {
////            return [NSString stringWithFormat:@"<video width=\"300\" height=\"225\" controls=\"controls\" style=\"margin:14px auto; display:block;\"><source src='%@' type='video/3gpp; codecs=\"mp4v.20.8, samr\"'></video>", self.videoUrl];
////        }
//        NSLog(@"url = %@",self.videoUrl);
//        return [NSString stringWithFormat:@"<video width=\"300\" height=\"225\" controls=\"controls\" src=\"%@\" style=\"margin:14px auto; display:block;\"></video>", self.videoUrl];
//        
//    }
    return @"";
}

- (NSString *) description
{
    
    
//    return nil;
    
    return [NSString stringWithFormat:@
            "<html>"
                "<style>*{padding:0;margin:0;}</style>"
            
                "<body>"
                
                    "<div style=\"padding:7px 14px; line-height:20px;\">"
                        "<p style=\"font-size:14px;font-weight:bold;\">%@<p>"
                        "<p style=\"font-size:12px;color:#999999;\">%@</p>"
                    "</div>"
                    
                    "<div style=\"width:300px; margin:0 auto; height:1px;border-bottom:1px dashed #DCDCDC;\">"
                    "</div>"
                    
                    "%@<div style=\"padding:14px; line-height:20px;\">%@</div>"
                    
                    "<script>"
                        "var resizeImg = function(img, maxWidth){"
                        "var w = img.width,"
                        "h = img.height;"
                        "if(w <= maxWidth) return;"
                        "h = h*maxWidth/w;"
                        "w = maxWidth;"
                        "img.width = w;"
                        "img.height = h;"
                        "img.style.width = w;"
                        "img.style.height = h;"
                        "}\n"
                        "var images = document.getElementsByTagName(\"img\");"
                        "for(var i = 0; i < images.length; i++) {"
                        "images[i].onload=function(){"
                        "resizeImg(this, 292);"
                        "}"
                        "}"
                    "</script>"
                "</body>"
            "</html>", self.title, self.time, [self videoTag], ([self.content isKindOfClass:[NSString class]]?self.content:@"")];
}

@end
