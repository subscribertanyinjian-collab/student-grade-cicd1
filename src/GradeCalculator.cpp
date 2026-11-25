#include &quot;GradeCalculator.h&quot;

char calculateLetterGrade(int score) {
if (score &gt;= 80) return &#39;A&#39;;
if (score &gt;= 65) return &#39;B&#39;;
if (score &gt;= 50) return &#39;C&#39;;
return &#39;F&#39;;
}

bool isPassing(int score) {
return score &gt;= 50;
}
