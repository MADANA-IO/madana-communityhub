package de.madana.webclient.dto;

public class MDN_DTO_SetPassword {
	   private String password;
	    private String matchingPassword;
	    private String email;
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getMatchingPassword() {
			return matchingPassword;
		}
		public void setMatchingPassword(String matchingPassword) {
			this.matchingPassword = matchingPassword;
		}

		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
	     
}
