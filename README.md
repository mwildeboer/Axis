# Axis

### Introduction

Axis is a declarative way of laying out subviews. Originally I was really excited about AutoLayout, but in practice I found it frustrating, hard to debug and prone to unexpected behaviour. I moved back to calculating frames, but at times I missed declaring layouts with AutoLayout. That's why I started Axis.

### Installation

### Examples

In essence Axis is nothing more than an implementation based on the builder pattern. The builder callback will the provide you with an instance of the *AXLayoutMaker* class which allows you the match and set layout constraints. Let's say you have one view named *firstView*. Here is the most basis example:

    // CGRectMake(20, 20, 100, 100)
    [self.firstView layout:^(AXLayoutMaker *make) {
        [make.left equalTo:@20];
        [make.top equalTo:@20];
        [make.width equalTo:@100];
        [make.height equalTo:@100];
    }];

The *AXLayoutManager* will calculate and set the frame of the view that calls the layout method. In this case you could also simple use a CGRectMake and set the frame directly. I will show you an example with *secondView* which show you the power of Axis.

    // CGRectMake(130, 20, 100, 100)
    [self.secondView layout:^(AXLayoutMaker *make) {
        [make.left equalTo:self.firstView.right withOffset:10];
        [make.top equalTo:self.firstView.top];
        [make.width equalTo:self.firstView.width];
        [make.height equalTo:self.firstView.height];
    }];

In this example we mix and match attributes, both from constraints of the *AXLayoutManager* and the view. A little bit like you would do with AutoLayout. We want to place the left edge of *secondView* to the right edge of *firstView* and add a little margin of 10. Plus we want the top, width and height of *secondView* to be the same as *firstView*. Axis will handle the tedious calculations for you.

Finally we have *thirdView*. 

    // CGRectMake(20, 130, 210, 100)
    [self.thirdView layout:^(AXLayoutMaker *make) {
        [make.top equalTo:self.firstView.bottom withOffset:10];
        [make.left equalTo:self.firstView.left];
        [make.right equalTo:self.secondView.right];
        [make.height equalTo:@100];
    }];

We want to place the top edge of *thirdView* to the bottom edge of *firststView* and add a little margin of 10. Plus we want the left edge of *thirdView* to be the same as the left edge of *firstView*, the right edge of *thirdView* should be the same as the right edge of *secondView*. 

You check and play with the constraints in the example project.

### Priorities

Axis use a set of priorities to make sure the calculations are right. With priorities I mean which attributes get calculated first.

1. Width and Height
2. Left, Top, Right and Bottom
3. CenterX, CenterY

If an attribute of the view already has been calculated, further calculations will be cancelled. This means. If you setup both the *left* and the *centerX* constraint for a view, the *left* constraint will be calculated first and the *centerX* constraint will be ignored.

### TODO

- [ ] Properly unit test
- [ ] Add origin, size and center constraint
- [ ] Extend the example
