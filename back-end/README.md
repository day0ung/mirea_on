# back-end
# JPA

* Spring Version 2.7.4
* Added dependencies:
  * Spring Boot DevTools
  * Spring Web
  * Spring Data JPA
  * MariaDb Driver

## JAP 알게된것들
  * @Entity: 영속성 컨텍스트에 의해 관리되는 클래스를 의미, 단순하게 테이블에 매핑되는 객체라고 생각
  * @Table: 엔티티에 매핑되는 데이터베이스 테이블 명
  * @Id: 기본키가 될 변수를 의미
    * https://changhyunit.tistory.com/m/74 DB연동 참고링크 

### DB연동시
  *  기존 spring boot 프로젝트에서는 MyBatis를 활용하여 xml작성 및 DAO,REPO를 작성 후 맵핑해주어야하는데, 그런부분이 필요가없어졌다.
  * 처음 프로젝트를 생성할때 MariaDb Driver를 추가해주었는데, 그부분은 삭제하고 'mysql:mysql-connector-java'를 추가해주었더니 잘됬다.
   