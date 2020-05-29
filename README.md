# SparkDefinitiveGuide
The Example Codes of "Spark The Definitive Guide"

## Install 실습환경 구축
- 책의 실습예제를 편하게 구동할 수 있게 docker를 사용합니다. Jupyter Notebook으로 구성되어있습니다. 
- 사전에 [docker 설치](https://docs.docker.com/engine/install/)와 [git 설치](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)가 필요합니다.

### Clone the repository 
아래 명령어로 repository 를 clone 한 후, 자신의 폴더로 이동합니다.
```shell
git clone https://github.com/dream2globe/SparkDefinitiveGuide.git
cd SparkDefinitiveGuide
```
### submodule 세팅
  - '스파크 완벽가이드' 책의 [예제 파일](https://github.com/FVBros/Spark-The-Definitive-Guide/tree/a1f81d09687c227c1401f11d5e7ef1a49651a6f9)을 가져오기 위해 [submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules)로 구성되어있습니다. 아래 명령어를 실행하여 책 예제 파일의 콘텐츠를 가져옵니다. 
```shell
git submodule init
git submodule update
```

### docker 사용
- docker 명령어와 기타 명령어를 편하게 사용할 수 있도록 [Makefile](Makefile) 설정되어 있습니다. (참고. [What is a Makefile and how does it work?](https://opensource.com/article/18/8/what-how-makefile))  
1. 실행 전 개인 개발환경으로 설정 변경  
  - docker 실행 설정을 자신의 폴더 위치로 바꾸어주어야합니다. `Makefile`의  `~/workspace/python/SparkDefinitiveGuide` 를 자신의 repository가 있는 폴더위치로 변경해주세요.  
  ```bash
  setup:
    docker run -p 8888:8888 -p 4040:4040 -p 4041:4041 -d --rm -v ~/workspace/python/SparkDefinitiveGuide:/home/jovyan/work --name my-spark-lab dream2globe/my-spark-env
  ```  
2. docker 실행
```shell
make setup
```
3. 웹 브라우저에서 [localhost:8888](localhost:8888) 에 접속합니다. Jupyter Notebook이 실행되며, password는 `mysparklab` 입니다.  
4. 사용을 종료하려면 docker 중지
```
make stop
```
