# Gradle on JDK 8
to use run 
```
docker run --rm mohamnag/gradle gradle <command>
```

It is an intention that this image does not set entry
point. Because it may be used in CI and automated builds
for doing some preparations before starting the build
or other gradle tasks like test.
