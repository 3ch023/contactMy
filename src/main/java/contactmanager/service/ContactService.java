package contactmanager.service;


import contactmanager.domain.Contact;

import java.util.List;

public interface ContactService {

	public void addContact(Contact contact);

	public List<Contact> listContact();

	public void removeContact(Integer id);
}
