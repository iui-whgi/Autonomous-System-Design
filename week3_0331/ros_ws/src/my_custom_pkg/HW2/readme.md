

action_server.py 파일은 시작전에 전역변수 파라미터 한번 로드하고 시작해야하고

action_server_paramload는 load코드까지 다 들어있다 하지만 set param가 안먹힘 코드를 파리미터 서브를 매번 실행할때마다 초기화시키기 때문에

> 가장 ROS친화적인 방법은 launch파일 사용하는 방식이다