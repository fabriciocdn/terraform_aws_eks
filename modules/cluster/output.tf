output "eks_oidc" {
  value = data.tls_certificate.eks_oidc_tls_cert.certificates[*].sha1_fingerprint
}