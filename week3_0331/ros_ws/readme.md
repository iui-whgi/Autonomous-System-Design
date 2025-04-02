
rosscore들 죽이는 코드

```
killall -9 roscore rosmaster rosout roslaunch
```

```
rosnode list | grep client
```

파라미터 load
```
rosparam load ~/Desktop/ros_ws/src/my_custom_pkg/config/max_number_params.yaml
```

```
rosparam set card_trick/max_number 11
```
```
rosparam get card_trick/max_number
```

```
card_trick_client
```

custom msg , 파리미터, action에 대해서, 코드의 핵심부분만 설정해서,  
action 어떻게 설정해쏙 서버의 핵심부분 어떻게 구성했는지 , 