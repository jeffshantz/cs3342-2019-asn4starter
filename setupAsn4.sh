#!/bin/bash

if [[ ! -d '.git' ]]
then
  echo "Run this in the *root* of your Git repository"
  exit -1
fi

for i in `seq 1 8`
do
  mkdir -p asn4/q${i}
  touch asn4/q${i}/q${i}.hs
done

mkdir -p asn4/q9

[[ ! -f 'asn4/q9/Customer.java' ]] && (curl -Ls https://raw.githubusercontent.com/jeffshantz/cs3342-2019-asn4starter/master/q9/Customer.java > asn4/q9/Customer.java)
[[ ! -f 'asn4/q9/CustomerManager.java' ]] && (curl -Ls https://raw.githubusercontent.com/jeffshantz/cs3342-2019-asn4starter/master/q9/CustomerManager.java > asn4/q9/CustomerManager.java)
[[ ! -f 'asn4/q9/CustomerTest.java' ]] && (curl -Ls https://raw.githubusercontent.com/jeffshantz/cs3342-2019-asn4starter/master/q9/CustomerTest.java > asn4/q9/CustomerTest.java)

cat <<-EOF >>.gitignore
setupAsn4.sh
asn4/*
!asn4/README
!asn4/README.md
!asn4/evaluation.pdf
!asn4/q[1-9]/
asn4/q[1-9]/*
!asn4/q1/q1.hs
!asn4/q2/q2.hs
!asn4/q3/q3.hs
!asn4/q4/q4.hs
!asn4/q5/q5.hs
!asn4/q6/q6.hs
!asn4/q7/q7.hs
!asn4/q8/q8.hs
!asn4/q9/Customer.java
!asn4/q9/CustomerManager.java
!asn4/q9/CustomerTest.java
EOF

cat <<-EOF
Your assignment 4 skeleton is now set up.
Please put your answers in the provided files within the 'asn4/q*' directories.
Failure to adhere to this layout will result in a deduction of 20%.

You should now commit and push your code:
-----------------------------------------
git add .
git commit -m "Initial asn4 commit"
git push

Then, after finishing each problem, commit and push:
----------------------------------------------------
git add .
git commit -m "Finished q1"
git push

When you are ready to submit, commit, push, and tag your commit:
----------------------------------------------------------------
git add .
git commit -m "Final submission"
git push
git tag asn4
git push --tags

Good luck!
EOF
