# Required IAM Policy for AWS CCM
data "aws_iam_policy_document" "aws_ccm" {
  count = var.iam_instance_profile == "" && var.enable_ccm ? 1 : 0

  statement {
    effect    = "Allow"
    resources = ["*"]
    actions = [                "ec2:DescribeInstances",
                "autoscaling:DescribeTags",
                "autoscaling:DescribeLaunchConfigurations",
                "ecr:GetDownloadUrlForLayer",
                "ec2:DescribeRegions",
                "ecr:GetAuthorizationToken",
                "ecr:ListImages",
                "ec2:DeleteVolume",
                "ec2:CreateVolume",
                "ec2:ModifyVolume",
                "ec2:AttachVolume",
                "autoscaling:DescribeAutoScalingGroups",
                "ec2:DescribeVolumes",
                "ecr:BatchGetImage",
                "ecr:DescribeRepositories",
                "ec2:DetachVolume",
                "ec2:CreateTags",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetRepositoryPolicy"
    ]
  }
}

# Required IAM Policy for AWS Cluster Autoscaler
data "aws_iam_policy_document" "aws_autoscaler" {
  count = var.iam_instance_profile == "" && var.enable_autoscaler ? 1 : 0

  statement {
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLaunchConfigurations",
      "autoscaling:DescribeTags",
      "autoscaling:SetDesiredCapacity",
      "autoscaling:TerminateInstanceInAutoScalingGroup",
      "ec2:DescribeLaunchTemplateVersions"
    ]
  }
}
