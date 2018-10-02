#include <ctest.h>
#include <../src/calc.h>
#pragma once

CTEST(slozhenie_polozh_otric, slozhenye)
{
    int result = slozhenye(-2, 6);
    
    int expected = 4;
    ASSERT_EQUAL(expected, result);
}

CTEST(vychit_polozh_otric, vichitanye)
{
    int result = vichitanye(10, 3);
    
    int expected = 7;
    ASSERT_EQUAL(expected, result);
}

CTEST(umnoj_polozh_otric, umnozhenye)
{
    int result = umnozhenye(-7, 7);
    
    int expected = -49;
    ASSERT_EQUAL(expected, result);
}

CTEST(delen_polozh_otric, delenye)
{
    int result = delenye(-9, -3);
    
    int expected = 3;
    ASSERT_EQUAL(expected, result);
}
