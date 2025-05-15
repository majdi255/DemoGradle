FROM public.ecr.aws/amazoncorretto/amazoncorretto:21
ADD build/libs/DemoGradle*.jar DemoGradle.jar
ENTRYPOINT [ "java","-jar","DemoGradle.jar" ]