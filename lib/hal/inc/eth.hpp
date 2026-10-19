/// @defgroup eth Ethernet
/// @ingroup hal
/// @{
#pragma once

#include <stdint.h>
#include <string.h>

struct MAC {
    uint8_t byte[6];

    /// @brief `==` operator for @ref MAC s
    constexpr bool operator==(const MAC& o) const {
        for (int i = 0; i < 6; ++i)
            if (byte[i] != o.byte[i]) return false;
        return true;
    }

    /// @brief `!=` operator for @ref MAC s
    constexpr bool operator!=(const MAC& o) const { return !(*this == o); }

} __attribute__((packed));

static_assert(sizeof(MAC) == 6, "MAC must be exactly 6 bytes");

static constexpr MAC broadcast{{0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}};

/// @}
