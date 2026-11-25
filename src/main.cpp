#include &lt;iostream&gt;
#include &lt;string&gt;

#include &quot;GradeCalculator.h&quot;

int main(int argc, char* argv[]) {
// Post-deployment smoke/health check mode
if (argc &gt; 1 &amp;&amp; std::string(argv[1]) == &quot;--health-check&quot;) {
if (calculateLetterGrade(85) == &#39;A&#39; &amp;&amp; isPassing(50)) {
std::cout &lt;&lt; &quot;HEALTH CHECK OK&quot; &lt;&lt; std::endl;
return 0;
}
std::cerr &lt;&lt; &quot;HEALTH CHECK FAILED&quot; &lt;&lt; std::endl;
return 1;
}

int score = 78;
std::cout &lt;&lt; &quot;Student Score: &quot; &lt;&lt; score
&lt;&lt; &quot; | Letter Grade: &quot; &lt;&lt; calculateLetterGrade(score)
&lt;&lt; &quot; | Status: &quot; &lt;&lt; (isPassing(score) ? &quot;PASS&quot; : &quot;FAIL&quot;)
&lt;&lt; std::endl;
return 0;
}
