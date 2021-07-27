//
// Created by 墨子痕 on 2021/7/20.
// Copyright (c) 2021 Hutter. All rights reserved.
//
// 169. 多数元素 https://leetcode-cn.com/problems/majority-element/
// 给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。
// 你可以假设数组是非空的，并且给定的数组总是存在多数元素。


#ifndef DATASTRUCTURESANDALGORITHM_MAJORITYELEMENT_H
#define DATASTRUCTURESANDALGORITHM_MAJORITYELEMENT_H

#import <vector>

class MajorityElement {
public:
    /**
      * @brief 169. 多数元素 https://leetcode-cn.com/problems/majority-element/
      * @param nums 数列，不为空
      * @return 超过一半的元素
      */
    static int majorityElement(std::vector<int> &nums);
};


#endif //DATASTRUCTURESANDALGORITHM_MAJORITYELEMENT_H
