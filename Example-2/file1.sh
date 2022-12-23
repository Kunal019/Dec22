list1=()
function1(){
        url=169.254.169.254/latest/meta-data
        for i in $(curl -s $url)
        do
                if [[  `echo $i | grep -v "/"` && $? = 0 ]]
                then                       
                        list1+=($i)
                else
                        for j in $(curl -s $url/$i)
                        do
                                if [[ `echo $j | grep -v "/"` && $? = 0 ]]
                                then                                        
                                        list1+=($i$j)
                                        fi
                        done
                        fi
        done
         }
function1
for item in ${list1[*]}
do
        echo $item: $(curl -s http://169.254.169.254/latest/meta-data/$item)
done
