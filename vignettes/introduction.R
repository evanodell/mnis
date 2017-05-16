## ----eval=FALSE----------------------------------------------------------
#  library(mnis)
#  x <- ref_titles(tidy = FALSE)
#  x
#  
#  #   Title_Id         Name
#  #1        22        Canon
#  #2         1         Dame
#  #4         3          Hon
#  #3         2           Dr
#  #6         5         Lord
#  #5         4         Lady
#  #7         6       Lt Col
#  #8        21       Lt Gen
#  #9         7         Miss
#  #10        8           Mr
#  #11        9          Mrs
#  #12       10           Ms
#  #13       11         Prof
#  #14       19    Professor
#  #15       12          Rev
#  #16       13       Rev Dr
#  #17       18         Revd
#  #18       20      Revd Dr
#  #20       15          Sir
#  #19       14     Reverend
#  #21       16      The Rev
#  #22       17 The Reverend

## ----eval=FALSE----------------------------------------------------------
#  library(mnis)
#  x <- ref_titles(tidy = TRUE)
#  x
#  
#  #   title_id         name
#  #1        22        Canon
#  #2         1         Dame
#  #4         3          Hon
#  #3         2           Dr
#  #6         5         Lord
#  #5         4         Lady
#  #7         6       Lt Col
#  #8        21       Lt Gen
#  #9         7         Miss
#  #10        8           Mr
#  #11        9          Mrs
#  #12       10           Ms
#  #13       11         Prof
#  #14       19    Professor
#  #15       12          Rev
#  #16       13       Rev Dr
#  #17       18         Revd
#  #18       20      Revd Dr
#  #20       15          Sir
#  #19       14     Reverend
#  #21       16      The Rev
#  #22       17 The Reverend

## ----eval=FALSE----------------------------------------------------------
#  library(mnis)
#  x <- mnis_party_state("2017-04-04")
#  x
#  
#  #         house party_id                       party_name party_male_count party_female_count party_total_count
#  # 1  Commons        4                     Conservative              260                 70               330
#  # 2  Commons       15                           Labour              128                101               229
#  # 3  Commons       29          Scottish National Party               36                 18                54
#  # 4  Commons       17                 Liberal Democrat                8                  1                 9
#  # 5  Commons        7        Democratic Unionist Party                8                  0                 8
#  # 6  Commons        8                      Independent                1                  3                 4
#  # 7  Commons       30                        Sinn Fein                4                  0                 4
#  # 8  Commons       22                      Plaid Cymru                2                  1                 3
#  # 9  Commons       31 Social Democratic & Labour Party                2                  1                 3
#  # 10 Commons       38            Ulster Unionist Party                2                  0                 2
#  # 11 Commons       44                      Green Party                0                  1                 1
#  # 12 Commons       47                          Speaker                1                  0                 1
#  # 13 Commons       35            UK Independence Party                1                  0                 1
#  # 14 Commons        0                           Vacant                0                  0                 1
#  

## ----eval=FALSE----------------------------------------------------------
#  > y <- mnis_party_state("Lords", "2017-04-04")
#  > y
#  # A tibble: 14 × 5
#  #      id                        name male_count female_count total_count
#  #*  <chr>                       <chr>      <chr>        <chr>       <chr>
#  #1      4                Conservative        192           62         254
#  #2     15                      Labour        137           65         202
#  #3      6                  Crossbench        138           40         178
#  #4     17            Liberal Democrat         68           34         102
#  #5     49              Non-affiliated         27            3          30
#  #6      3                     Bishops         23            2          25
#  #7      7   Democratic Unionist Party          3            0           3
#  #8     35       UK Independence Party          3            0           3
#  #9     10          Independent Labour          2            0           2
#  #10    38       Ulster Unionist Party          2            0           2
#  #11    44                 Green Party          0            1           1
#  #12    53 Independent Social Democrat          1            0           1
#  #13    52 Independent Ulster Unionist          1            0           1
#  #14    22                 Plaid Cymru          1            0           1
#  

