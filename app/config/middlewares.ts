export default ({ env }) => {
  const s3host = `${env("AWS_BUCKET_NAME")}.s3.${env(
    "AWS_REGION"
  )}.amazonaws.com`;

  return [
    "strapi::errors",
    // "strapi::security",
    "strapi::cors",
    "strapi::poweredBy",
    "strapi::logger",
    "strapi::query",
    "strapi::body",
    "strapi::session",
    "strapi::favicon",
    "strapi::public",
    {
      name: "strapi::security",
      config: {
        contentSecurityPolicy: {
          useDefaults: true,
          directives: {
            "connect-src": ["'self'", "https:"],
            "img-src": ["'self'", "data:", "blob:", s3host],
            "media-src": ["'self'", "data:", "blob:", s3host],
            upgradeInsecureRequests: null,
          },
        },
      },
    },
  ];
};
