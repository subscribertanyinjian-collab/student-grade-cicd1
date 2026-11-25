#include &lt;gtest/gtest.h&gt;
#include &quot;GradeCalculator.h&quot;

TEST(GradeCalculatorTest, HighScoreReturnsA) {
EXPECT_EQ(calculateLetterGrade(90), &#39;A&#39;);
}
