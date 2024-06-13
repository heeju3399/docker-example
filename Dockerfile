# 도커엔 리눅스 베이스 파일이 있음ㅁ 하지만 노드에서 제공하는 16버젼의 알파인이 있음!!
# 노드를 클릭하면 https://hub.docker.com/_/node/ 어떤걸 사용할수 있는지 나옴!!
FROM node:20-alpine

# 리눅스 명령어임
WORKDIR /app

# 빈번히 수정되는 부분은 멘 마지막에 사용할것 
COPY package.json package-lock.json ./

#RUN npm install 대신에  npm ci 가 더좋다 이유는 install은 최신버젼을 다운 실행하는데 
#ci는 package-lock에 있는 해당버젼을 그대로 다운 실행함

RUN npm ci

COPY index.js .

# https://docs.docker.com/reference/dockerfile/?highlight=entrypoint#entrypoint 참고
ENTRYPOINT [ "node", "index.js" ]

# https://docs.docker.com/build/building/best-practices/ 좋은 도커 파일 만들기
# 빈번히 수정되는것은 마지막에 적기 이미지를 다시 만들지 않음

# 실행 docker build -f Dockerfile -t fun-docker . 
# 이건 이미지 만드는 것임ㅁ
# .은 빌드 콘텍드스 (최상단 실행하라)
# -f 는 도커 파일 이름
# -t 는 이미지 이름

# 실행 docker run -d -p8083:8081 fun-docker
# 이건 컨테이너 만드는 것임ㅁ

# -d detached 백그라운드에서 동작해야하는데 계속 돌아가게!
# -p 는 포트 (8083은 호스트 포트 , 8081은 서버 포트)
# docker logs 해당 아이디

# 도커 허브에 푸쉬!
# docker tag fun-docker:latest heeju3399/docker-example:latest
# 도커허브의 이름으로 이미지이름 변경후에
# 도커 로그인 docker login
# 도커에 푸쉬! docker push heeju3399/docker-example:latest
# 푸쉬 안됨ㅁ.. 아마도 여기 아이디랑 허브 아이디가 달라서 그런듯 다시 해보기
# https://nirsa.tistory.com/53
# https://velog.io/@eunsilson/Docker-Docker-Hub-push-%EC%8B%A4%ED%8C%A8-requested-access-to-the-resource-is-denied

# docker pull heeju66/docker-example