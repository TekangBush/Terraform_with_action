#my bucket variable block
variable "mybucket" {
    description = "give a name to your bucket"
    type= string 
    default= "bootcam30_9_enoh"
  
}
 # variable for my the tag name of my kms key
 variable "tags" {
    description = "give a tag name to your kms key"
    type= string 
    default= "my_kms_key"
  
}