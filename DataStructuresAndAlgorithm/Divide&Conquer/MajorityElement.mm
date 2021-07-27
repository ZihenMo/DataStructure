//
// Created by 墨子痕 on 2021/7/20.
// Copyright (c) 2021 Hutter. All rights reserved.
//

#include "MajorityElement.h"
#import <vector>
#import <unordered_map>

using namespace std;

#pragma mark - 多数元素

/**
 * @brief 【一】暴力法，双层循环每个值并记录其次数，仅记录最大值；
 */
int majorityElement_1(vector<int> &nums) {
    int maxIndex = 0;
    int maxCount = 0;
    for (int i = 0; i < nums.size(); ++i) {
        int count = 1;
        for (int j = 1; j < nums.size(); ++j) {
            if (nums[i] == nums[j]) {
                count += 1;
            }
        }
        if (count > maxCount) {
            maxCount = count;
            maxIndex = i;
        }
    }
    return nums[maxIndex];
}

/**
 * @brief 【二】哈希法【优】
 */
int majorityElement_2(vector<int> &nums) {
    unordered_map<int, int> count_tab;
    int maxVal = nums.front();
    int maxCount = 0;
    for (int n : nums) {
        count_tab[n]++;
        if (count_tab[n] > maxCount) {
            maxVal = n;
            maxCount = count_tab[n];
        }
    }
    return maxVal;
}

/**
 * @brief 【三】排序+搜索最大重复元素 O(NLogN)
 * 也可以不用搜索，直接返回n/2下标的元素；因为一定有解，且其数量超过一半。
 */
int majorityElement_3(vector<int> &nums) {
    sort(nums.begin(), nums.end());
    int repeat = 1;
    int i = 0;
    for (; i < nums.size() - 1 && repeat <= nums.size() / 2; ++i) {
        if (nums[i] == nums[i + 1]) {
            ++repeat;
        } else {
            repeat = 1;
        }
    }
    return nums[i];
}

int majority_count_in_range(vector<int> &nums, int e, int l, int r) {
    int count = 0;
    for (int i = l; i <= r; ++i) { // 错点一：这里的r是[l,r]
        if (nums[i] == e) {
            ++count;
        }
    }
    return count;
}

int majority_partition(vector<int> &nums, int l, int r) {
    if (l == r) {
        return nums[l];
    }
    int mid = (r - l) / 2 + l;// (r + l) / 2; 错点二：important !!!不是 (l + r ) / 2
    int left = majority_partition(nums, l, mid);
    int right = majority_partition(nums, mid + 1, r);
    if (left == right) {
        return left;
    }
    if (majority_count_in_range(nums, left, l, r) > (r - l + 1) / 2) { // 错点三：1.中点的取值；2.range为[l,r]而非[l,mid]注意不是(l+r)/2+1
        return left;
    } else {
        return right;
    }
}

/**
 * @brief 【四】分治法 T: O(NLogN) S:O(LogN)
 * 因为众数大于一半，如果将数列平均分两组，则从数一定会在左右两边中至少出现一个。
 * 因此问题可以划分问题的结果中选择得出。
 * 1.划分左右两部边求解；
 * 2.如果解相同，则正确返回；
 * 3.如果不同，则求数量多的一边；
 * 4.设计求某元素在区域内数量的工具方法。
 */
int majorityElement_4(vector<int> &nums) {
    return majority_partition(nums, 0, nums.size() - 1);
}

/**
 * @brief 【五】投票法 T：O(n) S:O(1)
 * 由于众数超过一半，我们将其一个众数配一个非众数，留下的一个一定是众数；
 * 因此，设众数+1，非众数-1；假定首个为众数，如果操作结果为0则换一个元素。（即便是非众数匹配非从数，
 * 匹配完剩下的也一定是众数，因为众数超过一半）
 */
int majorityElement_5(vector<int> &nums) {
    int ret = -1;
    int count = 0;
#if 0
    for (int n : nums) {
        if (count == 0) {
            ret = n;
        }
        n == ret ? count += 1 : count -= 1;     // 切换时，多了一次判断
    }
#endif
    for (int n : nums) {
        if (n == ret) {
            ++count;
        } else if (--count < 0) {
            ret = n;
            count = 1;      // 【1】置1
        }
    }
    return ret;
}


/**
 * @brief 解法有四
 * 【一】暴力法，双层循环记录最大值；T:O(n^2) S:O(1)
 * 【二】HashMap，方便好用。T:O(n) S:O(n)
 * 【三】排序再找相邻重复元素次数。T:O(NLogN S：O(n)，若原数列空间可变则为O(1).
 * 【四】分治法，T：O(NLogN) S:O(LogN)，虽然本身不需要分配额外空间，但由于递归性质需要保存状态。
 * 【五】投票【优】T:O(n) S:O(1)
 */
int MajorityElement::majorityElement(vector<int> &nums) {
//    return majorityElement_1(nums);
//    return majorityElement_2(nums);
//    return majorityElement_3(nums);
//    return majorityElement_4(nums);
    return majorityElement_5(nums);
}
