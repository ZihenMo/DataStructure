
#import <vector>
#import <iostream>
template <typename T>
void printVector(std::vector<T> vector) {
    for (auto v : vector) {
        std::cout << v << " ";
    }
    std::cout << std::endl;
}