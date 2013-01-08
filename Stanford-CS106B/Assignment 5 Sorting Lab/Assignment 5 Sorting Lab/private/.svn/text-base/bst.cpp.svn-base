/*
 * File: private/bst.cpp
 * Last modified on Thu Jun 11 09:17:43 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the implementation of the bst.h interface.
 * Because of the way C++ compiles templates, this code must be
 * available to the compiler when it reads the header file.
 */

#ifdef _bst_h

template <typename ElemType>
BST<ElemType>::BST(int (*cmp)(ElemType, ElemType)) {
	root = NULL;
	cmpFn = cmp;
	numNodes = 0;
	timestamp = 0L;
}

template <typename ElemType>
BST<ElemType>::~BST() {
	recDeleteTree(root);
}

template <typename ElemType>
void BST<ElemType>::recDeleteTree(nodeT * t) {
	if (t != NULL) {
		recDeleteTree(t->left);
		recDeleteTree(t->right);
		delete t;
	}
}

template <typename ElemType>
int BST<ElemType>::size() {
	return numNodes;
}

template <typename ElemType>
bool BST<ElemType>::isEmpty() {
	return root == NULL;
}

template <typename ElemType>
void BST<ElemType>::clear() {
	recDeleteTree(root);
	root = NULL;
	numNodes = 0;
	timestamp++;
}

/*
 * Implementation notes: find, recFindNode
 * ---------------------------------------
 * The find method simply calls recFindNode to do the work.
 * The recursive function takes the current node along with the
 * original argument.  If found, it overwrites the reference
 * parameter with the copy and returns a pointer to the data.
 */

template <typename ElemType>
ElemType *BST<ElemType>::find(ElemType key) {
	nodeT *found = recFindNode(root, key);
	if (found == NULL) return NULL;
	return &found->data;
}

template <typename ElemType>
typename BST<ElemType>::nodeT *BST<ElemType>::recFindNode(nodeT *t,
	                                                  ElemType & key) {
	if (t == NULL) return NULL;
	int sign = cmpFn(key, t->data);
	if (sign == 0) return t;
	if (sign < 0) {
		return recFindNode(t->left, key);
	} else {
		return recFindNode(t->right, key);
	}
}

/*
 * Implementation notes: add, recAddNode
 * -------------------------------------
 * The add method is implemented as a simple wrapper
 * to recAddNode, which does all the work.  The difference
 * between the prototypes is that recAddNode takes a reference
 * to the root of the current subtree as an extra argument.
 * For reasons of efficiency (we don't know how large ElemType
 * might be), we pass it by reference.
 *
 * The return value from recAddNode is true or false, depending on
 * whether the height of the subtree was increased by one or not.
 * At base case, returns true for new node, false for overwite. As
 * it works its way upwards, if that additional height is added to
 * to existing balanace factor and results in factor that is
 * more than +- 1, then a rotation is done to fix the imbalance.
 */

template <typename ElemType>
bool BST<ElemType>::add(ElemType data) {
	bool createdNewNode = false;
	recAddNode(root, data, createdNewNode);
	if (createdNewNode) timestamp++;
	return createdNewNode;
}

template <typename ElemType>
bool BST<ElemType>::recAddNode(nodeT * & t, ElemType & data,
                               bool & createdNewNode) {
	if (t == NULL) {
		t = new nodeT;
		t->data = data;
		t->bf = BST_IN_BALANCE;
		t->left = t->right = NULL;
		createdNewNode = true;
		numNodes++;
		return true;
	}
	int sign = cmpFn(data, t->data);
	if (sign == 0) {
		t->data = data;
		createdNewNode = false;
		return false;
	}
	int bfDelta = 0;
	if (sign < 0) {
		if (recAddNode(t->left, data, createdNewNode)) {
			bfDelta = -1;   /* left subtree is higher */
		}
	} else {
		if (recAddNode(t->right, data, createdNewNode)) {
			bfDelta = +1;   /* right subtree is higher */
		}
	}
	updateBF(t, bfDelta);
	return (bfDelta != 0 && t->bf != BST_IN_BALANCE);
}

/*
 * Function: updateBF
 * Usage: updateBF(t, bfDelta);
 * ----------------------------
 * Updates the balance factor in the node and rebalances the
 * tree if necessary.
 */

template <typename ElemType>
void BST<ElemType>::updateBF(nodeT * & t, int bfDelta) {
	t->bf += bfDelta;
	if (t->bf < BST_LEFT_HEAVY) {
		fixLeftImbalance(t);
	} else if (t->bf > BST_RIGHT_HEAVY) {
		fixRightImbalance(t);
	}
}

/*
 * Function: fixLeftImbalance
 * Usage: fixLeftImbalance(t);
 * ---------------------------
 * This function is called when a node has been found that
 * is out of balance with the longer subtree on the left.
 * Depending on the balance factor of the left child, the
 * code performs a single or double rotation.
 */

template <typename ElemType>
void BST<ElemType>::fixLeftImbalance(nodeT * & t) {
	nodeT *child = t->left;
	if (child->bf == BST_RIGHT_HEAVY) {
		int oldBF = child->right->bf;
		rotateLeft(t->left);
		rotateRight(t);
		t->bf = BST_IN_BALANCE;
		switch (oldBF) {
		  case BST_LEFT_HEAVY:
			t->left->bf = BST_IN_BALANCE;
			t->right->bf = BST_RIGHT_HEAVY;
			break;
		  case BST_IN_BALANCE:
			t->left->bf = t->right->bf = BST_IN_BALANCE;
			break;
		  case BST_RIGHT_HEAVY:
			t->left->bf = BST_LEFT_HEAVY;
			t->right->bf = BST_IN_BALANCE;
			break;
		}
	} else if (child->bf == BST_IN_BALANCE) {
		rotateRight(t);
		t->bf = BST_RIGHT_HEAVY;
		t->right->bf = BST_LEFT_HEAVY;
	} else {
		rotateRight(t);
		t->right->bf = t->bf = BST_IN_BALANCE;
	}
}

/*
 * Function: rotateLeft
 * Usage: rotateLeft(t);
 * ---------------------
 * This function performs a single left rotation of the tree
 * that is passed by reference.  The balance factors
 * are unchanged by this function and must be corrected at a
 * higher level of the algorithm.
 */

template <typename ElemType>
void BST<ElemType>::rotateLeft(nodeT * & t) {
	nodeT * child = t->right;
	t->right = child->left;
	child->left = t;
	t = child;
}

/*
 * Function: fixRightImbalance
 * Usage: fixRightImbalance(t);
 * ---------------------------
 * This function is called when a node has been found that
 * is out of balance with the longer subtree on the right.
 * Depending on the balance factor of the right child, the
 * code performs a single or double rotation.
 */

template <typename ElemType>
void BST<ElemType>::fixRightImbalance(nodeT * & t) {
	nodeT *child = t->right;
	if (child->bf == BST_LEFT_HEAVY) {
		int oldBF = child->left->bf;
		rotateRight(t->right);
		rotateLeft(t);
		t->bf = BST_IN_BALANCE;
		switch (oldBF) {
		  case BST_LEFT_HEAVY:
			t->left->bf = BST_IN_BALANCE;
			t->right->bf = BST_RIGHT_HEAVY;
			break;
		  case BST_IN_BALANCE:
			t->left->bf = t->right->bf = BST_IN_BALANCE;
			break;
		  case BST_RIGHT_HEAVY:
			t->left->bf = BST_LEFT_HEAVY;
			t->right->bf = BST_IN_BALANCE;
			break;
		}
	} else if (child->bf == BST_IN_BALANCE) {
		rotateLeft(t);
		t->bf = BST_LEFT_HEAVY;
		t->left->bf = BST_RIGHT_HEAVY;
	} else {
		rotateLeft(t);
		t->left->bf = t->bf = BST_IN_BALANCE;
	}
}

/*
 * Function: rotateRight
 * Usage: rotateRight(t);
 * ----------------------
 * This function performs a single right rotation of the tree
 * that is passed by reference.  The balance factors
 * are unchanged by this function and must be corrected at a
 * higher level of the algorithm.
 */

template <typename ElemType>
void BST<ElemType>::rotateRight(nodeT * & t) {
	nodeT * child = t->left;
	t->left = child->right;
	child->right = t;
	t = child;
}

/*
 * Implementation notes: remove
 * ----------------------------
 * The first step in removing a node is to find it using binary
 * search, which is performed by the recRemoveNode method.  If the
 * node is found, RemoveTargetNode does the actual deletion.
 */

template <typename ElemType>
bool BST<ElemType>::remove(ElemType data) {
	bool didRemove = false;
	recRemoveNode(root, data, didRemove);
	if (didRemove) timestamp++;
	return didRemove;
}

/*
 * Implementation notes: recRemoveNode
 * -----------------------------------
 * This method implements the general case for removing a node.
 * In addition to taking the root of the tree as a parameter, this
 * method takes a flag called didRemove, which is set if a matching
 * was found in the search.  The function returns the change in the
 * size of the tree rooted at t.
 */

template <typename ElemType>
bool BST<ElemType>::recRemoveNode(nodeT * & t, ElemType & data,
                                  bool & didRemove) {
	if (t == NULL) return false;
	int sign = cmpFn(data, t->data);
	if (sign == 0) {
		didRemove = true;
		return removeTargetNode(t);
	}
	int bfDelta = 0;
	if (sign < 0) {
		if (recRemoveNode(t->left, data, didRemove)) bfDelta = +1;
	} else {
		if (recRemoveNode(t->right, data, didRemove)) bfDelta = -1;
	}
	updateBF(t, bfDelta);
	return (bfDelta != 0 && t->bf == BST_IN_BALANCE);
}

/*
 * Implementation notes: removeTargetNode
 * --------------------------------------
 * This function removes the node which is passed by
 * reference as t.  The easy case occurs when either of the
 * children is NULL; all you need to do is replace the node with
 * its non-NULL child.  If both children are non-NULL, this code
 * finds the rightmost descendent of the left child; this node
 * may not be a leaf, but will have no right child.  Its left
 * child replaces it in the tree, after which the replacement
 * data is moved to the position occupied by the target node.
 */

template <typename ElemType>
bool BST<ElemType>::removeTargetNode(nodeT *  & t) {
	nodeT *toDelete = t;
	if (t->left == NULL) {          /* No left child, replace with right */
		t = t->right;
		delete toDelete;
		numNodes--;
		return true;
	} else if (t->right == NULL) {  /* No right child, replace with left */
		t = t->left;
		delete toDelete;
		numNodes--;
		return true;
	} else {  /* node has both children, replace with max of left */
		nodeT *successor = t->left;
		while (successor->right != NULL) {
			successor = successor->right;
		}
		t->data = successor->data;
		bool unused;
		if (recRemoveNode(t->left, successor->data, unused)) {
			updateBF(t, 1);
			return (t->bf == BST_IN_BALANCE);
		}
		return false;
	}
}

/*
 * Implementation notes: mapAll, recBSTAll
 * ----------------------------------------
 * The mapAll function is implemented as a wrapper to the
 * recursive function recBSTAll, which does the actual work
 * of calling the function on all values during an InOrder walk.
 */
template <typename ElemType>
void BST<ElemType>::mapAll(void (*fn)(ElemType)) {
	recBSTAll(root, fn);
}

template <typename ElemType>
void BST<ElemType>::recBSTAll(nodeT * t, void (*fn)(ElemType)) {
	if (t != NULL) {
		recBSTAll(t->left, fn);
		fn(t->data);
		recBSTAll(t->right, fn);
	}
}

template <typename ElemType>
template <typename ClientDataType>
	void BST<ElemType>::mapAll(void (*fn)(ElemType, ClientDataType &),
	                           ClientDataType & data) {
		recBSTAll(root, fn, data);
	}

template <typename ElemType>
template <typename ClientDataType>
void BST<ElemType>::recBSTAll(nodeT *t, void (*fn)(ElemType, ClientDataType &),
                              ClientDataType & data) {
	if (t != NULL) {
		recBSTAll(t->left, fn ,data);
		fn(t->data, data);
		recBSTAll(t->right, fn, data);
	}
}

template <typename ElemType>
const BST<ElemType> &BST<ElemType>::operator=(const BST & rhs) {
	if (this != &rhs) {
		clear();
		copyOtherEntries(rhs);
		timestamp = 0L;
	}
	return *this;
}

template <typename ElemType>
BST<ElemType>::BST(const BST & rhs) {
	root = NULL;
	copyOtherEntries(rhs);
	timestamp = 0L;
}

template <typename ElemType>
static void AddToTree(ElemType elem, BST<ElemType> & tree) {
	tree.add(elem);
}

/*
 * Private method: copyOtherEntries
 * Usage: copyOtherEntries(otherBST);
 * ----------------------------------
 * This methods adds a copy of all entries from the other map to
 * this one.
 *
 * Implementation note: We aren't really adhering to const. Even though
 * the methods invoked on rhs don't modify it, they aren't marked const,
 * and thus trigger compiler problems. We cast away const-ness to avoid
 * this erroneous complaints. Sigh.
 *
 * The implementation also maps over the cells to copy as a workaround
 * for a bug in Metrowerks C++ compiler, which can't handle the
 * dual-templated map function correctly.
 */

template <typename ElemType>
void BST<ElemType>::copyOtherEntries(const BST & constRhs) {
	BST & rhs = const_cast<BST &>(constRhs);
	cmpFn = rhs.cmpFn;
	rhs.mapAll< BST<ElemType> >(AddToTree, *this);
	numNodes = rhs.numNodes;
}

/*
 * BST::Iterator class implementation
 */

template <typename ElemType>
BST<ElemType>::Iterator::Iterator() {
	bstp = NULL;
}

template <typename ElemType>
typename BST<ElemType>::Iterator BST<ElemType>::iterator() {
	return Iterator(this);
}

template <typename ElemType>
BST<ElemType>::Iterator::Iterator(BST *bstptr) {
	bstp = bstptr;
	timestamp = bstp->timestamp;
	if (bstp->root == NULL) return;
	iteratorMarkerT marker = { (void *) bstp->root, false };
	stack.push(marker);
	findLeftmostChild();
}

template <typename ElemType>
bool BST<ElemType>::Iterator::hasNext() {
	if (bstp == NULL) Error("hasNext called on uninitialized iterator");
	if (timestamp != bstp->timestamp) {
		Error("BST structure has been modified");
	}
	return !stack.isEmpty();
}

template <typename ElemType>
ElemType BST<ElemType>::Iterator::next() {
	if (bstp == NULL) Error("next called on uninitialized iterator");
	if (!hasNext()) {
		Error("Attempt to get next from iterator"
		      " where hasNext() is false");
	}
	nodeT *np = (nodeT *) stack.peek().np;
	ElemType result = np->data;
	advanceToNextNode();
	return result;
}

template <typename ElemType>
void BST<ElemType>::Iterator::advanceToNextNode() {
	iteratorMarkerT marker = stack.pop();
	nodeT *np = (nodeT *) marker.np;
	if (np->right == NULL) {
		while (!stack.isEmpty() && stack.peek().processed) {
			stack.pop();
		}
	} else {
		marker.processed = true;
		stack.push(marker);
		marker.np = (void *) np->right;
		marker.processed = false;
		stack.push(marker);
		findLeftmostChild();
	}
}

template <typename ElemType>
void BST<ElemType>::Iterator::findLeftmostChild() {
	nodeT *np = (nodeT *) stack.peek().np;
	if (np == NULL) return;
	while (np->left != NULL) {
		iteratorMarkerT marker = { (void *) np->left,  false };
		stack.push(marker);
		np = np->left;
	}
}

template <typename ElemType>
ElemType BST<ElemType>::foreachHook(FE_State & fe) {
	if (fe.state == 0) fe.iter = new Iterator(this);
	if (((Iterator *) fe.iter)->hasNext()) {
		fe.state = 1;
		return ((Iterator *) fe.iter)->next();
	} else {
		fe.state = 2;
		return ElemType();
	}
}

#endif
