#include <iostream>
#include <cstring>

#include "test/test_txt.h"

constexpr size_t BUF_SIZE = 512;

int main(int argc, char* argv[]) {
    char buf[BUF_SIZE];
    memcpy(buf, test::txt::start(), test::txt::size());
    std::cout << buf;
}
