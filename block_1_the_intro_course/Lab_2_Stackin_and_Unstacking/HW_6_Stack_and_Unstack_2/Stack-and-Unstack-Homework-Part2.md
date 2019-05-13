**Stack and Unstack Homework - The Big Reversal**

Dr. Bergen[^1] is at it again! He had a follow-up meeting with his
client and it was determined that we need to redo the file construction
from an earlier assignment. Recall that the file **health\_survey.csv**
contains the responses to a series of health-related questions and we
coded the responses as 1-5 using the definition below. It turns out that
some of the columns need a reverse coding (see the *Needs Reverse
Coding?* column in **ReverseCodingItems.csv**.

  Old Label                      New Coded Value   Reverse Coding
  ------------------------------ ----------------- ----------------
  "Strongly Disagree"            1                 5
  "Somewhat Disagree"            2                 4
  "Neither Agree nor Disagree"   3                 3
  "Somewhat Agree"               4                 2
  "Strongly Agree"               5                 1

1.  Look at the questions that need reverse coding and explain why it
    makes sense to reverse the coding on these items.

2.  You will need to redo the file construction, but now need to take
    the reverse coding into account. **For each step, paste a screenshot
    of the JMP dialog or formula associated with the outcome.**

    a.  *Stack* the columns.

        ![../../../../Desktop/Screen%20Shot%202018-03-22%20at%201.30.46%20](img//media/image1.png){width="2.9192377515310586in"
        height="1.8521150481189852in"}

        **JMP screenshot: **

    b.  Make a new column called *Needs Reverse* by *Recoding* the
        Question Identifier to "Yes" or "No" per the *Needs Reverse
        Coding?* column in **ReverseCodingItems.csv.**

        ![../../../../Desktop/Screen%20Shot%202018-03-22%20at%201.35.26%20](img//media/image2.png){width="3.7831474190726158in"
        height="1.6723567366579177in"}

        **JMP screenshot: **

    c.  Make a new column called *Temp Coded Value* by *Recoding* the
        Questions Responses to the New Coded Values.

        ![../../../../Desktop/Screen%20Shot%202018-03-22%20at%201.38.06%20](img//media/image3.png){width="4.1588670166229225in"
        height="1.6545242782152232in"}

        **JMP screenshot: **

    d.  Make a new column called *Temp Coded Value* by *Recoding* the
        Questions Responses to the Reversed Coded Values.

        ![../../../../Desktop/Screen%20Shot%202018-03-22%20at%201.39.35%20](img//media/image4.png){width="4.518589238845144in"
        height="2.2754101049868765in"}

        **JMP screenshot: **

    e.  Make a new column called *Recoded Value* that holds the correct
        value for each question. You will want to use an MATCH statement
        and use *Needs Reverse* to decide which temporary value to use.

        ![../../../../Desktop/Screen%20Shot%202018-03-22%20at%201.43.10%20](img//media/image5.png){width="2.2279385389326336in"
        height="2.2862204724409447in"}

        **JMP screenshot: **

    f.  Make a new column by *Recoding* the Question Types to *F1, F2,
        ..., F6. *

        ![../../../../Desktop/Screen%20Shot%202018-03-22%20at%201.45.03%20](img//media/image6.png){width="2.9782928696412947in"
        height="2.4497976815398075in"}

        **JMP screenshot: **

    g.  *Aggregate* and *Split.*

![../../../../Desktop/Screen%20Shot%202018-03-22%20at%201.46.11%20](img//media/image7.png){width="2.9779385389326336in"
height="1.8010990813648293in"}
![../../../../Desktop/Screen%20Shot%202018-03-22%20at%201.46.34%20](img//media/image8.png){width="3.60625in"
height="1.7887478127734033in"}

**JMP screenshot: **

1.  Submit this document with your answer to question 1 and a csv file
    with your final table.

[^1]: Director of the Statistical Consulting Center at Winona State
    University
